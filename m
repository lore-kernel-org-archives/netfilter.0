From: "Tanneeru Muralidhar Babu-A19589" <muralidharbabu@motorola.com>
Subject: iptables execution with sudo fails
Date: Mon, 6 Oct 2008 12:56:33 +0800
Message-ID: <548BC174642DC44AB25D749C28840FD308C72D7F@ZMY16EXM66.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

 Hi,
 
While executing iptables command using sudo on my system (running MV
2.6.10), I see following errors. Could someone please help me understand
this error ?
 
sudo:        0 : uid 0 does not exist in the passwd file! ; TTY=unknown
; PWD=unknown ; USER=root ; COMMAND=/sbin/iptables
 
Is this a problem with passwd file ? Under what circumstances do we see
this error ?
 
Thanks,
Murali
