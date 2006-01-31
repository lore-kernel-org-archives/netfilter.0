From: kelly <kelly@cliffhanger.com>
Subject: Re: NAT with iptables / linux
Date: Tue, 31 Jan 2006 11:48:22 -0600
Message-ID: <22533.5267409266$1138733711@news.gmane.org>
References: <dac71d7b0601261219q39b58368w@mail.gmail.com>
	<002101c622c0$dc643de0$0101000a@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <002101c622c0$dc643de0$0101000a@sterenborg.info>
Content-disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Maybe this will help.

http://home1.gte.net/res0psau/security/nat-on-linux.html


-- 
kelly
http://home1.gte.net/res0psau/index.html#Hang-Gliding-Stuff

	   --    -- 
	     \  /
	      \/
	      /\
	     /  \
	   --    --



Quoting Rob Sterenborg <rob@sterenborg.info>:
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
        
        

