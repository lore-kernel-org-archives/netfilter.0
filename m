From: "j davis" <davis_compz@hotmail.com>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 09 Jul 2002 19:03:26 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F220gdjK9H7z2VZT3tS0000b5d6@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


also...do

mii-tool from the command line to see your duplex and you
can use a program called bing to test through put between
2 interfaces.

jd
http://www.taproot.bz



>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>To: <netfilter@lists.samba.org>
>Subject: Re: Speed Issues through NAT Firewall
>Date: Tue, 9 Jul 2002 19:08:22 +0100
>MIME-Version: 1.0
>Received: from [198.186.203.85] by hotmail.com (3.2) with ESMTP id 
>MHotMailBEF47481004D40043251C6BACB559E280; Tue, 09 Jul 2002 11:20:56 -0700
>Received: from va.samba.org (localhost [127.0.0.1])by lists.samba.org 
>(Postfix) with ESMTPid A0731495C; Tue,  9 Jul 2002 11:20:47 -0700 (PDT)
>Received: from vulcan.rissington.net (mail.rissington.net 
>[213.121.241.158])by lists.samba.org (Postfix) with ESMTP id 57318495Efor 
><netfilter@lists.samba.org>; Tue,  9 Jul 2002 11:08:40 -0700 (PDT)
>Received: from there (dhcp211 [192.168.192.211] (may be forged))by 
>vulcan.rissington.net (8.10.2/8.10.2) with SMTP id g69I8R810149for 
><netfilter@lists.samba.org>; Tue, 9 Jul 2002 19:08:27 +0100
From netfilter-admin@lists.samba.org Tue, 09 Jul 2002 11:21:44 -0700
>Delivered-To: netfilter@lists.samba.org
>Message-Id: <200207091808.g69I8R810149@vulcan.rissington.net>
>Organization: Software Solutions
>X-Mailer: KMail [version 1.3.2]
>References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com> 
><20020709194926.A17608@oknodo.bof.de> 
><005501c22772$1ef01240$6702a8c0@mindtrip.com>
>In-Reply-To: <005501c22772$1ef01240$6702a8c0@mindtrip.com>
>Sender: netfilter-admin@lists.samba.org
>Errors-To: netfilter-admin@lists.samba.org
>X-BeenThere: netfilter@lists.samba.org
>X-Mailman-Version: 2.0.8
>Precedence: bulk
>List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
>List-Post: <mailto:netfilter@lists.samba.org>
>List-Subscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=subscribe>
>List-Id: netfilter user discussion list <netfilter.lists.samba.org>
>List-Unsubscribe: 
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
>List-Archive: <http://lists.samba.org/pipermail/netfilter/>
>
>On Tuesday 09 July 2002 6:57 pm, Travis Crook wrote:
>
> > The firewall on the DSL is an Athlon XP 1500+.  The firewall on the ISP
> > line is a PII 333.  I will check on the full/half duplex issue.
>
>That's a hell of a difference, and could conceivably account for the
>bandwidth.   I'd say it depends on how much RAM you have in the PII/333 and
>how many connections you're trying to support.
>
>
>
>Antony.
>


thanks,
jd

jd@taproot.bz
http://www.taproot.bz

thanks,
jd

jd@taproot.bz
http://www.taproot.bz

_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com


