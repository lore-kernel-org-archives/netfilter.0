From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Thu, 27 May 2004 19:06:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405271906.54858.Antony@Soft-Solutions.co.uk>
References: <20040527164327.6B8A1DBD@sterenborg.info> <119801c44414$60dc9500$49caa8c0@caris.priv>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <119801c44414$60dc9500$49caa8c0@caris.priv>
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

On Thursday 27 May 2004 6:59 pm, Peter Marshall wrote:

> I actually don't need the dnat as I have internet routable ip's in my dmz
> .... Thank you for the info.  My question now is, will your rule take care
> of both passive and active ftp ?  I would prefer to just use active .. but
> I know many clients would have their own issues .. grr .. stupid ftp ....

ip_conntrack_ftp does handle both passive and active ftp.

Obviously if you're not doing DNAT then you don't need the ip_nat_ftp module 
either.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


