From: Lists <lists@sapience.com>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied
	to eth1.
Date: 12 Sep 2002 00:11:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031803906.2607.5.camel@pop.prv.sapience.com>
References: <87sn0g4p8o.fsf@prium.net> <3D7F8925.7050102@sapience.com> 
	<20020911183220.HHVX13709.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020911183220.HHVX13709.mta07-svc.ntlworld.com@there>
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

Yes sorry you're right - this is redhat specific - I believe it is
consumed by ifup which confirms the mac address matches before it
actually ifup's the interface.Notrhing to do with netfilter really ...

On Wed, 2002-09-11 at 14:32, Antony Stone wrote:
> On Wednesday 11 September 2002 7:19 pm, Lists wrote:
> 
> > .. 
> 
> Sorry, what does this do ?   This looks specific to some distribution to me 
> (and not one that I use) so it would be nice to know what happens to that 
> information and how it gets integrated with netfilter rules ?
> 
> Antony.
>
> 




