From: Jason Opperisano <opie@817west.com>
Subject: Re: IP+MAC based firewall rule
Date: Mon, 28 Feb 2005 19:46:44 -0500
Message-ID: <1109638003.4632.33.camel@hubcap.ljm.dom>
References: <d0f833ec05022802142bae59d1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <d0f833ec05022802142bae59d1@mail.gmail.com>
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

On Mon, 2005-02-28 at 05:14, Osama Hashmi wrote:
> Hi Everyone,
> 
> Can anyone tell me that how can i place firewall rule based on both IP
> Address and the Network Card's MAC Address. I want to do so because i
> want to limit my clients that if any of my clients changes his
> ipaddress his packets start dropping and he is unable to connect the
> server.

first--answering your question:

  iptables -N verifyMac

  iptables -A verifyMac -m mac --mac-source $HOST1_MAC \
    -s $HOST1_IP -j RETURN
  iptables -A verifyMac -m mac --mac-source $HOST2_MAC \
    -s $HOST2_IP -j RETURN
  iptables -A verifyMac -m mac --mac-source $HOST3_MAC \
    -s $HOST3_IP -j RETURN
  [ ... ]
  iptables -A verifyMac -j LOG --log-prefix "INVALID MAC/IP COMBO: "
  iptables -A verifyMac -j DROP

and then somewhere early in FORWARD:

  iptables -A FORWARD -j verifyMac

  [ rest of FORWARD rules ]

you could also do verify the mac/ip pair directly in FORWARD and jump to
a custom chain for your allowed FORWARD packets--something like:

  iptables -N allowFwd

  iptables -A FORWARD m mac --mac-source $HOST1_MAC \
    -s $HOST1_IP -j allowFwd
  iptables -A FORWARD m mac --mac-source $HOST2_MAC \
    -s $HOST2_IP -j allowFwd

and then put the allowed protocols/ports in the "allowFwd" chain.

two ways to accomplish the same thing.  the first one happens to match
the way my brain works.

keep in mind that neither is particularly scalable...that is--if there
are 500 machines behind this firewall, poor MAC/IP pair number 500 has
to traverse 499 rules every time he starts a connection...  :-(

second--an alternative to the iptables -m mac method:  put static arp
entries on your firewall.  the end effect is that an invalid MAC/IP
combo won't ever get any reply packets from the firewall, but it doesn't
have the audit trail capabilities (read: logging) that the iptables
method has--but it's better from a performance perspective.

you could also look into arpwatch to detect changes in mac/ip
pairings--which could be combined with the static arp entry method for
the audit trail.

just some thoughts--hope it helps.

oh yeah--and anyone with access to the local network can sniff out valid
mac/ip pairs and modify their NIC to bypass this type of filtering, but
i assume you are aware of this glaring limitation.

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
	--The Simpsons


