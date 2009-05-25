From: Thomas Jacob <jacob@internet24.de>
Subject: RE: Choices for virtual IP failover (was Re: Firewall in
	Load	Balance	- Active/Active)
Date: Mon, 25 May 2009 19:47:11 +0200
Message-ID: <1243273631.13703.7.camel@enterprise.ims-firmen.de>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <4A1A9756.6040401@netfilter.org>
	 <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
	 <1243260797.11783.29.camel@enterprise.ims-firmen.de>
	 <000b01c9dd44$c81bf5c0$5853e140$@bourke@mobileinternet.com>
	 <1243261872.12933.4.camel@enterprise.ims-firmen.de>
	 <000001c9dd57$5f2ae630$1d80b290$@bourke@mobileinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000001c9dd57$5f2ae630$1d80b290$@bourke@mobileinternet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 2009-05-25 at 17:39 +0100, John Bourke wrote:
> Thomas,
> 
> This is what I get for reading everything BUT the man page !
> 
> Found the preempt, but the checks seem to refer to the health checks of real
> servers
> 
>                   # one entry for each realserver
>                   real_server <IPADDR> <PORT>
>                      {
> 				 ...
>                          # Script to launch when healthchecker
>                          # considers service as up.
>                          notify_up <STRING>|<QUOTED-STRING>
>                          # Script to launch when healthchecker
>                          # considers service as down.
>                          notify_down <STRING>|<QUOTED-STRING>
> 
>                          # pick one healthchecker
>                          # HTTP_GET|SSL_GET|TCP_CHECK|SMTP_CHECK|MISC_CHECK
> 
> I don't think this can trigger a keepalived VRRp failover if a real server
> fails ??? (not that our scenario uses external real servers)

You really need the bleeding edge for the scripting checks:

http://www.keepalived.org/software/keepalived-1.1.17.tar.gz

cat doc/samples/keepalived.conf.vrrp.localcheck

! Configuration File for keepalived

vrrp_script chk_sshd {
       script "killall -0 sshd"        # cheaper than pidof
       interval 2                      # check every 2 seconds
       weight -4                       # default prio: -4 if KO
}

[...]

vrrp_instance VI_1 {
    interface eth0
    state MASTER
    virtual_router_id 51
    priority 100
    virtual_ipaddress {
        192.168.200.18/25
    }
    track_interface {
       eth1 weight 2   # prio = +2 if UP
       eth2 weight -2  # prio = -2 if DOWN
       eth3            # no weight, fault if down
    }
    track_script {
       chk_sshd                # use default weight from the script
       chk_haproxy weight 2    # +2 if process is present
       chk_http_port
       chk_https_port
       chk_smtp_port
    }
}


[..]


> Thanks
> 
> John
> 
> 
> -----Original Message-----
> From: Thomas Jacob [mailto:jacob@internet24.de] 
> Sent: 25 May 2009 15:31
> To: John Bourke
> Cc: 'Eduardo Sachs'; netfilter@vger.kernel.org
> Subject: RE: Choices for virtual IP failover (was Re: Firewall in Load
> Balance - Active/Active)
> 
> On Mon, 2009-05-25 at 15:26 +0100, John Bourke wrote:
> > Folks,
> > 
> > Keepalived does not seem to have a mechanism to failover on the failure of
> a
> > process on the system.  It has a load balancer which can select where
> > traffic is sent to based on a HTTP check or a script return code.  But
> that
> > is for server selection in load balancing.
> 
> It does in the latest versions, you can now add periodically run check
> scripts that can be used to determine a FAULT state.
> 
> > One thing you really need to consider is flip flopping.  If you have Node
> A
> > which is master, and when it goes down, Node B becomes master, the when
> node
> > A comes up again it will become master.  A mechanism to "stick to the node
> > last used" would be better so that a master with an intermittent failure
> > does not cause flip flops.
> 
> You can do that with keepalived as well, check out the preemption
> control parameters (noprempt etc.)
> 
> > Thanks
> > 
> > John
> 
> 
> 
> 

