From: Khaled Hussein <khaled@bisan.com>
Subject: Diskless and Firewall
Date: Thu, 01 Apr 2010 13:25:47 +0300
Message-ID: <1270117547.3335.15.camel@khaled-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Dear All, 

I am running a machine with diskless boot, it is running CentOS, i have
problem with iptables, when i restart iptables i lost connection with
NFS server so i lost my hard disks and machine become unreachable, this
happened when i use DROP as default policy on INPUT and OUTPUT and
FORWARD chains, i tried to use mangle table with default ACCEPT on these
chains but the same, if i changed default policy to ACCEPT on above
chains, so is there any way to avoid this problem

Thanks to all 


Best Regards,
==========================
Khaled J. Hussein
Senior System Engineer
Bisan Systems Ltd.
Tel: +970-22985941
Fax: +970-22985942
Web: www.bisan.com
Email: khaled@bisan.com
========================== 




*************
This  message has been scanned for viruses and dangerous content by Bisan Systems Ltd  MailScanner, and is believed  to be clean. Bisan Systems Ltd  does  not  represent  that  any  attachment  is free from computer viruses or defects and the user assumes all responsibility  for any  loss, damage  or  consequence  resulting  directly  or  indirectly  from  the use of any attachment. The information  contained  in  any  email  does not necessarily  reflect the views of Bisan systems or any other related entities or persons.

