From: "Jan Agermose" <ja@conviator.com>
Subject: forward/proxy/something one external IP to an other
Date: Fri, 26 Sep 2008 12:50:44 -0400
Message-ID: <CD6321314686A64C90A1F5870AAD3D5201566663@MAIL031.mail.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


hi

we are going to move some servers from one datacenter to an other and
not all DNS are under our direct control so Im want to place a linux box
in the old center to forward trafic for the old IPs to the new IPs - or
Im hoping this is possible :) So that traffic going to the old IPs will
still work until all DNS is updated. 

The servers are on a NAT 1-1 network and are moved to a new 1-1 NAT
network - if this matters? 

Can someone explain if its possible and how to do it? 

regards
Jan


