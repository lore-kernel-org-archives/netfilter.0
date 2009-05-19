From: Azher Mughal <azher@hep.caltech.edu>
Subject: Iptables only on specified interface
Date: Mon, 18 May 2009 17:33:15 -0700
Message-ID: <4A11FE4B.8050902@hep.caltech.edu>
Reply-To: azher@hep.caltech.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a server with 1G NIC for management (with public ip) and 10G
NIC for data transfers on internal network. When i apply iptables (i
simply restrict ssh for few networks, no fancy stuff) on external
NIC and allow the 10GE nic, it seems that system still does some
sort of processing.

I am using CentOS 5.3. Without any of the iptables applied i can get
the line rate on 10GE without any trouble with stable cpu usage.

Any thoughts ?

Thanks
-Azher
