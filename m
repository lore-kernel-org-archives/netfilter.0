From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: OK dumb questions
Date: Thu, 11 Dec 2003 18:51:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111851.09417.Antony@Soft-Solutions.co.uk>
References: <20031211110904.6e96f533.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031211110904.6e96f533.mgale@utilitran.com>
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

On Thursday 11 December 2003 6:09 pm, Michael Gale wrote:

> Hello,
>
> 	I have a firewall setup with the default policy to block.
>
> I have a DNAT rule to DNAT incoming connections to a internal IP.
> I then have a EXT to INT forward rule for port 80 - state NEW
> I then have a EXT to INT forward rule for ESTABLISHED connections
> I then have a INT to EXT forward rule for ESTABLISHED connections
>
> This is working great the problem ...
>
> I am not able to get this machine to make a out bound connection :(

Because there is no rule INT to EXT for NEW packets.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


