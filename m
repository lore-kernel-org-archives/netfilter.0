From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: multiple public ips to multiple internal ips
Date: Sat, 30 Jan 2010 23:10:24 +0200
Message-ID: <4B64A040.2080300@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I need to setup a router to match multiple public ips to multiple 
internal ips.

I need to do it one by one, because I want it to be dynamic.

I mean: I want to be able to change external ip for a specific server at 
any time. I am building a set of scripts where an internal server will 
request from the router to change his external ip. The router will 
change and reload his configuration dynamically.

I have a set of 10 public ip addresses for about 5 internal servers.

My router is a Linux Fedora 11 box, kernel 2.6.30.10-105.fc11.x86_64 
with iptables-1.4.3.1-1.fc11.x86_64 installed.

Is there somewhere a step by step howto to help me configure iptables? 
Maybe a thread in this list?

I checked some threads but I found only configurations for range of ips, 
not for individual ips.

I checked some iptables Howtos: There are a lot about one public ip to 
multiple internal, I haven't found any on multiple to multiple.

Thanks for help
Patrick

