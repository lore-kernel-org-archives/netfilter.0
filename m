From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward or masquerade
Date: Wed, 19 May 2004 20:52:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405192052.03188.Antony@Soft-Solutions.co.uk>
References: <BAY15-F27RoEQHo6CkI00088c4e@hotmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F27RoEQHo6CkI00088c4e@hotmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 19 May 2004 8:39 pm, azeem ahmad wrote:

> hi all
> i want to drop some traffic being masqueraded by my lan like 21
> where should i drop these packets either in FORWARD chain or in POSTROUTING
> chain

Dropping packets is a filtering action, therefore it should be done in the 
filter table of the FORWARD chain.

POSTROUTING does not have a filter table - it has a nat table, and it is for 
performing Network Address Translations.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


