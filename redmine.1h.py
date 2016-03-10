#!/usr/local/bin/python3
# -*- coding: utf-8 -*-
import sys
import io
import requests
from const import (
    api_key,
    my_ticket_url,
    release_branches_url,
    issue_url
)

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')


def get_my_tickets():

    if api_key == "":
        return False
    r = requests.get("{}&key={}".format(my_ticket_url, api_key))
    project_tickets = r.json()

    try:
        response = project_tickets.get('issues')
    except KeyError:
        return False

    return response


def get_release_branches():

    if api_key == "":
        return False
    r = requests.get("{}&key={}".format(release_branches_url, api_key))
    branches = r.json()

    try:
        response = branches.get('issues')
    except KeyError:
        return False

    return response

try:
    tickets = get_my_tickets()
    branches = get_release_branches()
    print('Redmine Tickets')
    print('---')
    print(' チケット|color=blue')
    for d in tickets:
        print('[ {} ]  {}| href={}/{}'.format(d.get('id'), d.get('subject'), issue_url, d.get("id")))
    print(' リリースブランチ|color=blue')
    for d in branches:
        print('[ {} ]  {}| href={}/{}'.format(d.get('id'), d.get('subject'), issue_url, d.get("id")))


except Exception as inst:
    print('Error')
    print('---')
    print(type(inst))
    print(inst.args)
    print(inst)
