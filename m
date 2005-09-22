From: Michael Gale <michael.gale@pason.com>
Subject: Re: DMZ howto
Date: Thu, 22 Sep 2005 14:11:37 -0600
Message-ID: <43330FF9.30106@pason.com>
References: <BAY102-F4C8101DA6F8045906536AAE970@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F4C8101DA6F8045906536AAE970@phx.gbl>
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
To: P theodorou <props666999@hotmail.com>, netfilter@lists.netfilter.org

Hello,

    A DMZ / SSN (Separate secure network) is where you would put servers 
that require access from internally and externally.

So example you setup a firewall with 3 interfaces:

External
DMZ
Internal

Now on the DMZ you may place your company mail server for example. All 
mail from the Internet would come in and be forwarded to the server in 
the DMZ. This way if the mail server is compromised the intruder will 
have not gained access to your internal corporate network. A company web 
server would be another example, but not a intra net web server.

The firewall rules between EXT <=> DMZ should be as secure as possible, 
same with DMZ<=>INT.

I hope this helps clear some things up a little.

Michael

P theodorou wrote:

> Hello
>
> I want to achieve the firewall script in the official iptables tutorial
> 1.20 version practices here 
> http://iptables-tutorial.frozentux....MZ.firewall.txt
>
> typically a well known set up is
> to receive traffic from the ISP via dhcp which assigns IP to eth0
> and eth0 forwords traffic to eth1 (NAT) which is the default gateway 
> for a laptop .
>
> Now the machine has eth0 eth1 and eth2 so far we have spoken
> for eth1 . Eth2 i wanted to be a DMZ for servers who need passive 
> connections
> FTP etc...
>
> The concept of DMZ confuses me , can you suggest any resources
> for the topic ?
>
> Really appreciated
>
>
>

