From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Flag SYN not necessarily state NEW?
Date: Sat, 15 Jun 2002 07:33:18 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <002001c21468$d4683a70$020aa8c0@matttm9svd8lrh>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan>
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
To: Hard__warE <hard__ware@hotmail.com>, netfilter@lists.samba.org

> I have tested this as im running SSH ans as you can see hear in the print
> out of my packets that
> i dont even need a Established Related Rule for SSH from the Internet or
> Internaly , this is handled
> by IP_conntrack moddule and so on .. :-) .

I must not be understanding what you're saying here, because you definitely
need both a NEW and ESTABLISHED rule.   In fact, this should always apply
and I would be rather disappointed in netfilter if there were any
exceptions. Don't think you need a RELATED rule however (at least it seems
to function without one). FWIW to the original poster, I log incoming NEW
ssh connections and it has always worked and still does.  If I connect
twice, it logs it twice. kernel version: 2.4.18, iptables version: 1.2.6a.

Goodluck
Matt



