From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Mail Server Behind IPTABLES
Date: Wed, 1 Sep 2004 07:22:48 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e5040831212267c70f95@mail.gmail.com>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i eth1 -d 202.62.x.x -p tcp --dport 25
-j DNAT --to 10.0.0.10

On Wed, 1 Sep 2004 13:01:10 +1200, Ajen Diwakar <ajen@nsl.com.fj> wrote:
> Hi All
> 
> I am new to IPTABLES usage. I have linux(RH) 9.0.
> The external IP address eth1 is 202.62.x.x
> The internal ip address is 10.0.0.4
> 
> My mail server IP address is 10.0.0.10
> 
> How do I setup my iptables so that the mail to my record get transfred
> to the mail server.
> 
> Any assistance will be appreciated.
> 
> 


-- 
Bla bla

