From: Jason Cook <jg0327@yahoo.com>
Subject: Re: Port Redirection with iptables
Date: Wed, 17 Dec 2003 06:48:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031217144801.46461.qmail@web41106.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

I tried port scanning the linux box.  Port 80
responded as Squid.  The PREROUTING line in my
iptables showed traffic. 

This might be a stupid question, but how do you set up
the client to use the linux box as a
gateway/firewall/cache server?

I have the linux box set as the default gateway/DNS
server on the client machine (along with the real DNS
server)


> > I am trying to install Linux as a firewall and
> caching
> > server with iptables and Linux.  I 
> > need to do this transparently.
> > 
> > I installed Red Hat Linux 9.  Ran all of the
> updates
> > nice and smooth.  Turned on ip forwarding.  
> > Configured Squid...and tested it by specifying the
> > servers ip address and port 3128 from the 
> > browser.  Works great.  Here the options I had
> changed
> > in the config file.


__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/

