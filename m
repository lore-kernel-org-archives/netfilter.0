From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: accounting NAT-ed packets
Date: Sun, 19 Dec 2004 14:04:34 +0200
Message-ID: <3063e50412190404c2625ca@mail.gmail.com>
References: <20041219101257.GA16236@daleka.net>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041219101257.GA16236@daleka.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Piotrek Kaczmarek <kaczorek@k.daleka.net>
Cc: netfilter@lists.netfilter.org

Yea, in mangle POSTROUTING, or in filter FORWARD the packets which are
going to be nat-ed. nat table counts only the first packet from a
stream


On Sun, 19 Dec 2004 11:12:57 +0100, Piotrek Kaczmarek
<kaczorek@k.daleka.net> wrote:
> Hello,
> 
> I want to account all traffic from the address assigned to the linux box
> (including NAT, locally generated traffic), but i can't. The rule
> iptables -t mangle -A POSTROUTING -s 213.25.213.42
> seems not to ,,catch'' NAT-ed packets, only locally generated traffic.
> 
> Is there any method to ,,catch'' packets after NAT with netfilter?
> 
> Best Regards,
> 
> --
> Piotr Kaczmarek
> 
> 


-- 
Bla bla

