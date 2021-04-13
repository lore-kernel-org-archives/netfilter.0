From: mose@onionmail.info
Subject: Fail-closed option? (Make all policies "drop" by default for newly created
        namespaces)
Date: Tue, 13 Apr 2021 23:25:49 GMT
Message-ID: <u11ahpbsujy4632sneges8wa3@onionmail.info>
Reply-To: mose@onionmail.info
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: mose@onionmail.info
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Is there any option to make newly created namespaces start in a 
fail-closed (policy drop) state by default? For example a sysctl option 
perhaps? I want traffic to be dropped in case nftables fails due to a 
syntax error or a missing interface or any other problem. The assumption 
being that a valid, atomically-loaded, nftables.conf will override it 
from inside the container at some point.

I came up with a workaround in a few of my containers by creating a 
separate "nftables-early.service" systemd service which happens 
Before=network.target and is WantedBy=network-pre.target (if I recall 
correctly). However this is dependent on the container OS (e.g. 
non-systemd OSes) and will never be as robust as a fail-closed kernel 
option would be.
