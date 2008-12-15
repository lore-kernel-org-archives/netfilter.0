From: "John Lister" <john.lister@kickstone.co.uk>
Subject: Using statistics and nth match
Date: Mon, 15 Dec 2008 17:27:13 -0000
Message-ID: <08F6A8E685BA41278C7A9860BF198F9F@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

With the old nth module, you could specify the counter used. There doesn't 
seem to be this option with the new statistic module.

Does it have only 1 counter? If not how does it work out which counter is 
used?

For example i have a number of places in my rules where i want to make a 
decision based on the load. These places are in the shape of a simple tree, 
each branch should have its own counter along the lines of

iptables -A -m statistic --mode nth --every 2 --packet 0 -j BRANCH1
iptables -A -m statistic --mode nth --every 2 --packet 2 -j BRANCH2


iptables -A BRANCH1 -m statistic --mode nth --every 2 --packet 0 -j 
DO_SOMETHING_1
iptables -A BRANCH1 -m statistic --mode nth --every 2 --packet 1 -j 
DO_SOMETHING_2

iptables -A BRANCH2 -m statistic --mode nth --every 2 --packet 0 -j 
DO_SOMETHING_3
iptables -A BRANCH2 -m statistic --mode nth --every 2 --packet 1 -j 
DO_SOMETHING_4



Thanks 

