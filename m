From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: NAT with iptables / linux
Date: Thu, 26 Jan 2006 22:38:35 +0100
Message-ID: <002101c622c0$dc643de0$0101000a@sterenborg.info>
References: <dac71d7b0601261219q39b58368w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dac71d7b0601261219q39b58368w@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> I just buy my first 16 static ip pack and I am wondering what can I do
> to assign these ips to some workstation that I have.
> Something like this
> 
> =========
> =             =
> =   Lan     =     == Linux Box === Modem/router === Internet >>> =   
> = =========
> 
> Lets say I have local ips like 10.0.0.0/24 and "real" static ips like
> 195.170.2.1 , 195.170.2.2 and so on....
> And I want for every local ip to assing a static one.

You might want to use the NETMAP target for this :
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-NETMAP

(Yes : if you don't have this module already, you have to patch and
compile your own kernel and iptables.)

> In a few words I want every single workstation to have its
> own static ip..
> A friend of mine told to that I have to use POSTROUTING and PREROUTING
> and here is that I confused...
> Anyone can help me / tell me what exactly have to do to make
> this work ?

There is an example in the above url.

But, if you are confused by this then I think you also want to read up
in Oskars tutorial...
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


