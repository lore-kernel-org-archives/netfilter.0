From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: masq through an eth alias
Date: Thu, 13 Jun 2002 08:54:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206130754.g5D7sZA10488@Networker.rockstone.co.uk>
References: <200206130724.g5D7Omi00924@g38.rdsbv.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206130724.g5D7Omi00924@g38.rdsbv.ro>
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

On Thursday 13 June 2002 8:25 am, Petre Bandac wrote:

> can I masquerade through eth0:1 ?

You can't use the MASQUERADE target, no, but then you should only be using 
that if you have a dynamic address on the interface anyway (which I really 
doubt you have if you're setting up eth0:1 etc).

You can use -j SNAT --to <addr on eth0:1>

 

Antony.

