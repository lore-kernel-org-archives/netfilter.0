From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: dns server
Date: Thu, 6 Jun 2002 15:45:38 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206061542060.7290-100000@dns.toxicfilms.tv>
References: <200206061537.28204.raymondl@knowledgefactory.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061537.28204.raymondl@knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Francois Peyron <lists@peyron.nom.fr>, netfilter@lists.samba.org

Hello,

i think somebody should write a short and simple FAQ for this.
This type of questions are appearing very often.

I belive that, you do not need to add special filtering rules for
forwarders, secondaries, etc.

Properly configure your DNS server, use ACLs.

Using netfilter you can not judge whether TCP:53 packet is a zone transfer
or just a query.

Regards,
Maciej Soltysiak



