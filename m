From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 18:51:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081851.59512.Antony@Soft-Solutions.co.uk>
References: <6414C408-4208-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6414C408-4208-11D8-AFEE-000393677A36@porchlight.ca>
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

On Thursday 08 January 2004 6:28 pm, Peter Schobel wrote:

> Dec 24, 2003: patch-o-matic 20031219 (for kernel >= 2.4.18, including
> 2.4.23)
> Please note that this release still does not yet support the
> just-released 2.6.0 kernel.
> Expect a so-called 'patch-o-matic-ng' release for 2.6.x support in the
> next couple of weeks.
>
> Does this mean that iptables will not work with 2.6 kernel? This seems
> unlikely to me - I think i'm understanding it incorrectly - please
> clarify

You are correct - it does not mean that iptables won't work with kernel 2.6.

It simply means that this version of patch-o-matic will not work with kernel 
2.6 (which is understandable, considering that p-o-m patches the kernel...)

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


