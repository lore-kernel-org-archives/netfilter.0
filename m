From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: HELP--Is it posible to SNAT certain port--
Date: Wed, 10 Sep 2003 15:20:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910072010.GF7633@propaganda.localdomain>
References: <000801c32184$d34770a0$0706a8c0@r>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c32184$d34770a0$0706a8c0@r>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 24, 2003 at 07:40:58AM +0800, Ricky spoke thusly:

>Is it posibles to MASQ only sertain port (eg. smtp) package?
>That I want to let users mail with another ADSL to keep my web server
>working smooth.
>
>I mean, is this working?
>iptables -t nat -A POSTROUTING -p tcp --dport 25 -o eth0 -j SNAT --to
>1.2.3.4

Seems to work without issues for me.
-- 
The fact that the United States can label other countries as terrorist
states itself is quite remarkable because its not a secret that the United
States is incontrovertibly a terrorist state. -- Noam Chomsky

