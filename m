From: Chris <mlists@aon.at>
Subject: Re: Flag SYN not necessarily state NEW?
Date: Sat, 15 Jun 2002 16:52:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0B5493.AA326DCB@aon.at>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan> <002001c21468$d4683a70$020aa8c0@matttm9svd8lrh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Matthew Hellman <mhellman@raccoon.com>
Cc: Hard__warE <hard__ware@hotmail.com>, netfilter@lists.samba.org

Matthew Hellman wrote:
> I must not be understanding what you're saying here, because you 
> definitely need both a NEW and ESTABLISHED rule.   In fact, this should 
> always apply and I would be rather disappointed in netfilter if there 
> were any exceptions. Don't think you need a RELATED rule however (at 
< least it seems to function without one). FWIW to the original poster,
> I  log incoming NEW ssh connections and it has always worked and still 
> does.  If I connect twice, it logs it twice. kernel version: 2.4.18, 
> iptables version: 1.2.6a.

I have to excuse my question from 8.5., it was at a time where i just
started to play around with iptables (used ipchains before).
My posting came very delayed to this mailing-list (more than a month),
and in the meanwhile i can't "reproduce" this behaviour anymore. So i
think it was just a mistake on my side (wrong logging or whatever, some
mistake of a beginner :)).

		regards, Chris



