From: "David Busby" <busby@pnts.com>
Subject: Re: problem with samba
Date: Sat, 26 Jul 2003 13:19:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <025601c353b3$3cd80fb0$1100000a@busbydev>
References: <001501c353b1$8fa0c220$4fef5b86@stw.uniduisburg.de>
Reply-To: "David Busby" <busby@pnts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Sohail Ahmed Siddiqui <sohail@uni-duisburg.de>, netfilter@lists.netfilter.org

You might want to add 135, IIRC.
you can enable iptables LOG as last rule to see what packets get droped to
find the culprit.
Or maybe iptraf
/B
----- Original Message ----- 
From: "Sohail Ahmed Siddiqui" <sohail@uni-duisburg.de>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, July 26, 2003 13:07
Subject: problem with samba


> Hi all,
> i am new to iptables and i have a problem, i will be very greatful i fsome
> one helps me out.
> at my place i have a lan with 192.168.0.0/24 and in the building we have
> 134.91.239.0. i have managed to firewall my local net and access the
> internet with iptables but i want to share some files via samba. but my
> samba connection is not going out. i am using
>
> iptables -A FORWARD -j lan -p tcp --dport 137:139
> iptables -A FORWARD -j lan -p udp --dport 137:139
>
> but this some how doesnt seem to work.
> i have searched the internet but some how i didnt find any thing which can
> solve my problem. any help is welcome
> regards
> Sohail Ahmed Siddiqui
>


