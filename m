From: Stephanie_Martinez@Dell.com
Subject: I know this shouldn't be this hard
Date: Tue, 25 Jun 2002 12:09:09 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <B802F5F25EAD9B43A2D3A7A336853532025095C7@AUSXMPC117.aus.amer.dell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Its making my head hurt though :(

I've just finished setting up my firewall rules again to get my ip
masqurading working again.  However, I'm running a service on my linux box
that I also would like to run on a windows box, so what I'm looking to do is
forward a port from one box to another.  Sounds simple right? lol, so the
examples I've seen would have me think.

eth0 is my internet connection and is a dynamic ip so trying to stear clear
of anythig that requires an ip on it
eth1 is my internal network on the linux box and runs on ip 192.168.0.1
192.168.0.101 is the ip of the machine with the service i want to run

As hptotetical examples so that I can be sure I can  understand which is
which, lets say I want to forward any incomming connection to port 2000 on
the linux box (which would come in on eth0), to port 5000 on 192.168.0.101
(the windows machine).

Any help with figuring out where I'm going wrong is greatly appreciated.

I only get this list daily so if you want to respond directly at
stephanie_martinez@dell.com or send me an AOL IM at uglydamntoes I'd
appreciate it.  Trying to get this incorporated into my firewall startup
stuff, and i'm having fits figuring it out :(




