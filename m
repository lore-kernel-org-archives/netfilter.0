From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Wed, 19 May 2004 22:19:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405192219.33137.Antony@Soft-Solutions.co.uk>
References: <BAY15-F30mEB4HGXAwx000684fd@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F30mEB4HGXAwx000684fd@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 19 May 2004 10:05 pm, azeem ahmad wrote:

> iptables -t nat -A POSTROUTING -j MASQUERADE

Sorry - I forgot this bit in my last posting...

It would be a good idea to restrict the above rule to only your external 
interface:

iptables -A POSTROUTING -t nat -o $extIF -j MASQUERADE

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


