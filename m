From: Michael Niehren <michael@niehren.de>
Subject: Feature Requres for conntrack-tools
Date: Tue, 10 Jan 2012 13:35:19 +0100
Message-ID: <201201101335.20010.michael@niehren.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

i have the problem to delete all conntrack-entries sourced from an internal network,
let's say 192.168.70.0/24. As i can see, the conntrack-tool currently does only support 
single ip adresses. So currently i have to check for conntrack-entries for each single ip 
adress within the network.

So my request was to extend the -s switch to networks. Is that possible ?

best regards,
  Michael

-- 
Michael Niehren              __   _       powered by
                            / /  (_)__  __ ____  __
                           / /__/ / _ \/ // /\ \/ /
                          /____/_/_//_/\_,_/ /_/\_\
