From: "Jeremy Jones" <jeremy@samnjack.com>
Subject: RE: Transparent firewall
Date: Wed, 2 Jun 2004 14:17:46 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c448de$ab635590$4d0210ac@jccnjjonesxp2>
References: <40BE342C.6070005@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40BE342C.6070005@freemail.hu>
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
To: netfilter@lists.netfilter.org

You want bridging.  Start here: http://bridge.sourceforge.net/

jeremy jones

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Janos Makadi
Sent: Wednesday, June 02, 2004 2:10 PM
To: netfilter@lists.netfilter.org
Subject: Transparent firewall


Hi,

I have a problem, and I don`t know how to solve it.

What I would like to do is this:

I have a database server and I want to protect it. It has one nic 
connected to the local network. I want to setup a new linux box with two

nics connected to the same ip network like this:

        ****        ****
  ------*  *--------*  *
        ****        ****

       Linux       RDBMS

Every traffic has to go through the Linux box, and filter out the 
unneded packets. I dont know how to config the linux to use the same ip 
network with this confoguration. Let me explain. For example the server 
has 10.1.0.5/255.255.255.0 address, and all the clients use this network

config too. What ip addresses is allowed to use with the linux box? I 
mean can I use 10.1.0.4, 10.1.0.3 for the two nics at the linux box?

Any RTFM answers, with links is appreciated.

Thanks,

Janos Makadi


