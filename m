From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: Masquerading problem - question
Date: Sun, 08 Jan 2006 13:24:22 +0200
Message-ID: <43C0F666.20902@gmail.com>
References: <dac71d7b0601072221j8a15c80g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dac71d7b0601072221j8a15c80g@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Christos Panagiotakis wrote:

>Hello people. This is my first post, please be nice with me :-)
>
>I have a little network with 3 computers. 2 workstations, 1 server.
>the network is 10.166.0.0
>server 10.166.0.1
>1 workstation 10.166.0.2 and a new one the third 10.166.0.3
>server has 2 interfaces. the one is connected with another network
>( 10.165.0.0) wirelessly. from the "main" server they assigned me with
>2 internet static ips (for 10.166.0.1 and 10.166.0.2). But when I took
>the third one (10.166.0.3) I wanted to connect it with internet.
>I did echo 1 > /proc/sys/net/ipv4/ip_dynaddr
>and the problematic one:
>iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>thats good! it worked! But the problem is that both 10.166.0.2
>and 10.166.0.3 having internet with the server's ip address...
>I just want 10.166.0.3 to share the same static ip address.
>I dont know what exactly to do to make only 10.166.0.3 to "share"/masq
>the same ip with the server. And now I have both 10.166.0.2 and 10.166.0.3
>with the same ip, yeap its working but I need the second static ip to 10.166.0.2
>and I dont know what to do...
>
>Christos Panagiotakis
>
>ps: forgive me for my awful english I hope to understand me
>
>
>  
>
iptables -t nat -A POSTROUTING -s 10.166.0.3 -o eth0 -j SNAT --to 
$the_ip_address_wanted

That's if I understood you correct.


regards,
Georgi Alexandrov

