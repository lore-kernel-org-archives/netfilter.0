From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can I ? eth0 --> kernel-->User Space ---->Kernel--> Eth1
Date: Thu, 30 May 2002 22:00:46 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205302100.g4UL0lA20829@Networker.rockstone.co.uk>
References: <20020530205044.5139.qmail@web10406.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020530205044.5139.qmail@web10406.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 30 May 2002 9:50 pm, Art Reisman wrote:

> Before I beat my head too much I was wondering in this
> great world of iptables if it is possible to take
> packets up into user space look at them, and push them
> back out the other ethernet port ( essentially like
> they never left the wire).

I don't think so, no.

You can take packets up into userspace, but you would then have to send them 
back ut again from your own application - you can't just "hand them back over 
to netfilter".

You might want to look into Snort and/or Hogwash - sounds like they might 
help you do whatever it is you want to...

http://www.snort.org
http://hogwash.sourceforge.net

Hope this helps.


Antony.

