From: Aldo Lagana <ALagana@p21.com>
Subject: RE: Transparent firewall
Date: Wed, 2 Jun 2004 16:17:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35CC4@newman.p21.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Janos Makadi' <maki@freemail.hu>, netfilter@lists.netfilter.org

you want to BRIDGE the two interfaces - look at ebtables and BRIDGING HOW-TO

-----Original Message-----
From: Janos Makadi [mailto:maki@freemail.hu]
Sent: Wednesday, June 02, 2004 4:10 PM
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


Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



