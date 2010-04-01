From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Diskless and Firewall
Date: Thu, 1 Apr 2010 07:18:29 -0500
Message-ID: <20100401121829.GF7051@cardinal>
References: <1270117547.3335.15.camel@khaled-laptop>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1270117547.3335.15.camel@khaled-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Apr 01, 2010 at 01:25:47PM +0300, Khaled Hussein wrote:
> I am running a machine with diskless boot, it is running CentOS,
> i have problem with iptables, when i restart iptables i lost 
> connection with NFS server so i lost my hard disks and machine 
> become unreachable, this happened when i use DROP as default
> policy on INPUT and OUTPUT and FORWARD chains, i tried to use 
> mangle table with default ACCEPT on these chains but the same,
> if i changed default policy to ACCEPT on above chains, so is
> there any way to avoid this problem

1. Point gun away from foot (and other body parts)
2. [Optional] Pull trigger

rob0 rule of thumb: If you need to ask for help to make it work, you 
do not need OUTPUT filtering. Just say ACCEPT.

You cannot possibly secure a diskless boot system from possible 
attack by its rootfs NFS server. The idea of firewall limits between 
a system and its rootfs is ... silly. So also ACCEPT everything from 
the NFS server, in INPUT.

See "man iptables" and Netfilter packet flow diagrams (Wikipedia has 
one) to see why policies in the mangle table do not override your 
policies in the filter table.

> ==========================
> Khaled J. Hussein
> Senior System Engineer
> Bisan Systems Ltd.

Happy April Fools Day to you, too.

> Tel: +970-22985941
> Fax: +970-22985942
> Web: www.bisan.com
> Email: khaled@bisan.com
> ========================== 
> 
> 
> 
> 
> *************
> This message has been scanned for viruses and dangerous content by 
> Bisan Systems Ltd MailScanner, and is believed to be clean. Bisan 
> Systems Ltd does not represent that any attachment is free from 
> computer viruses or defects and the user assumes all responsibility 
> for any loss, damage or consequence resulting directly or 
> indirectly from the use of any attachment. The information 
> contained in any email does not necessarily reflect the views of 
> Bisan systems or any other related entities or persons.

And many thanks for that, as well. At least it doesn't have the 
offensively silly aspects of other email disclaimers.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
