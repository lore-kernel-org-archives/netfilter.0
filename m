From: Alin Nastac <mrness@technosoft.ro>
Subject: Re: iptables question - how to securely allow *just* outgoing smtp
Date: Tue, 25 Jun 2002 09:55:46 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1813F2.29FFD372@technosoft.ro>
References: <20020621083228.A21833@spawar.navy.mil> <200206211535.g5LFZbU03196@vulcan.rissington.net> <20020622102824.A32585@spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Christian Seberino wrote:

> I *could* define $SSH_PORT and $SMPT_PORT but
> doesn't iptables recognize ssh and smtp /already/
> as 22 and 25?

iptables recognise all ports names from /etc/services. You could use
--dport ssh instead --dport 22. Still, you must add before that -p tcp.
Without that, iptables cannot interpret --dport.


