From: Jason Opperisano <opie@817west.com>
Subject: Re: Restrict LAN users to send mail to Internet but allow to send
	mail to other LAN user.
Date: Wed, 27 Oct 2004 12:54:58 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041027165458.GA177@bender.817west.com>
References: <20041027145828.9818.qmail@web60402.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041027145828.9818.qmail@web60402.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 27, 2004 at 07:58:28AM -0700, ads nat wrote:
> Hi,
> I will elaborate my problem.
> 
> I am looking for solution for following problem.
> 
> I have A Linux interent gateway server having 3 NIC
> cards 
> 1) eth0 connected to internet.
> 2) eth1 connected to private LAN (192.168.0.1.)
> 3) eth2 connected to DMZ server.(10.0.0.1)
> 
> DMZ server is with one LAN card (eth0 : 10.0.0.2)
> 
> On DMZ, DNS, Web and sendmail are installed.
> Iptables prerouting rules are set on Gateway server so
> that users from LAN 192.168.0.0 can acess web as well
> as mail server.
> 
> Now I want to allow LAN users to send emails to each
> other on LAN but want to allow some LAN users to send
> email to Internet(Outside world).
> Is there any way using Linux iptables firewall to
> acieve this requirement.
> 
> thanks for support.

  # allow all LAN users to connect to DMZ mail server
  iptables -A FORWARD -i eth1 -o eth2 -p tcp --syn --dport 25 \
    -s 192.168.0.0/24 -d 10.0.0.2 -j ACCEPT

  # allow special machine to send mail directly to internet
  iptables -A FORWARD -i eth1 -o eth0 -p tcp --syn --dport 25 \
    -s $special_machine_IP -j ACCEPT

assuming you're running a "deny all, allow specific" type rulebase,
you're done.  if you're running an "allow all" rulebase, you'll need to
add:

  iptables -A FORWARD -i eth1 -p tcp --syn --dport 25 -j REJECT

-j

-- 
Jason Opperisano <opie@817west.com>

