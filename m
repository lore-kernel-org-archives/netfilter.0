From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd+Keepalived, active/active firewall cluster
Date: Tue, 02 Aug 2011 22:26:39 +0200
Message-ID: <4E385D7F.4020309@netfilter.org>
References: <BANLkTikiiTuiuNO-DOGjTchanAnTSDME0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080206050303060107020201"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikiiTuiuNO-DOGjTchanAnTSDME0Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: CeR <cer.inet@linuxmail.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080206050303060107020201
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, it seems this email got lost in my box.

On 07/06/11 00:08, CeR wrote:
> Hi there!
> With the last package I got of conntrack-tools I see some config files
> and shell scripts supposed to work in an active/active firewall
> cluster.
> Configuration files for keepalived are included.
> I have configured my system in the way I guess it may work, but have
> some doubts about the configuration and the system isn't working at
> all.

I expect that you're using the experimental scripts available here:
http://1984.lsi.us.es/git/?p=3Dcluster-match-scripts/.git;a=3Dtree

> Some issues:
> =B7 I think keepalived should give both nodes both IPV resources, so the
> load balancing can be succefully done with iptables (as seen in
> multiprimary.sh)

You have to define two resources (one for each node) without virtual IPs
(since both nodes will share the same IPs).

Please, find attached some toy-example file for keepalived. It needs to
be improved for the case when one dead node comes back to life, among
other things.

This stuff is still work-in-progress, I've been looking for some sponsor
to boost this development with no success so far. I'm busy with other
things that prevent me from prioritizing this feature.

> =B7 With the give configuration, Keepalived sometimes gives IPV
> resources to just one node, the other remains inactive and seems like
> a passive-backup node.
> =B7 In some cases, I have both nodes with both IPV resources, but it
> seems that some misconfiguration in iptables DROP packages needed by
> clients connections through the firewall. Maybe conntrackd not working
> properly in state replication?
>=20
> If anyone gives me some clues I could just write some documentation
> regarding this configuration, maybe with a little explanation of
> protocols and tools being implied. Or is there already some
> documentation?

All the documentation that you can find is available in the website.
There's another article that I wrote which I expect to release once it
is published in one journal. However, it does not describe how to deploy
this setup, it's more about design, implementation and evaluation.

> As you can see, right now i'm working in a non-production environment,
> but with more investigation and develop all can be done. I'm really
> interested in this.

Good luck with it.

--------------080206050303060107020201
Content-Type: text/plain;
 name="keepalived-multi1.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="keepalived-multi1.conf"

#
# Simple script for multi-primary setups
#

vrrp_sync_group G1 {   # must be before vrrp_instance declaration
  group {
    VI_1
    VI_2
  }
  notify_master "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh primary 1"
  notify_master_sync
  notify_backup "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh backup 1"
  notify_fault "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh fault 1"
}

vrrp_sync_group G2 {   # must be before vrrp_instance declaration
  group {
    VI_3
    VI_4
  }
  notify_master "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh primary 2"
  notify_master_sync
  notify_backup "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh backup 2"
  notify_fault "/home/pablo/devel/cluster-match-scripts/cluster-node1.sh fault 2"
}

vrrp_instance VI_1 {
    interface eth1
    state SLAVE
    virtual_router_id 61
    priority 90
    advert_int 1
    authentication {
      auth_type PASS
      auth_pass papas_con_tomate
    }
    # not needed - only for testing purposes
    virtual_ipaddress {
      192.168.0.111/24   # default CIDR mask is /32
    }
}

vrrp_instance VI_2 {
    interface eth2
    state SLAVE
    virtual_router_id 61
    priority 90
    advert_int 1
    authentication {
      auth_type PASS
      auth_pass papas_con_tomate
    }
    # not needed - only for testing purposes
    virtual_ipaddress {
      192.168.1.111/24   # default CIDR mask is /32
    }
}

vrrp_instance VI_3 {
    interface eth1
    state SLAVE
    virtual_router_id 62
    priority 10
    advert_int 1
    authentication {
      auth_type PASS
      auth_pass papas_con_tomate
    }
    # not needed - only for testing purposes
    virtual_ipaddress {
      192.168.0.222/24   # default CIDR mask is /32
    }
}

vrrp_instance VI_4 {
    interface eth2
    state SLAVE
    virtual_router_id 62
    priority 10
    advert_int 1
    authentication {
      auth_type PASS
      auth_pass papas_con_tomate
    }
    # not needed - only for testing purposes
    virtual_ipaddress {
      192.168.1.222/24   # default CIDR mask is /32
    }
}

--------------080206050303060107020201--
