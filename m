From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: I have to become a bandwidth Nazi , Netfilter useable.
Date: Sat, 1 Mar 2003 09:34:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030301153403.GA27466@placemark.com>
References: <000201c2dffa$8ad18480$0c05a8c0@Sherby> <200303011019.00158.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200303011019.00158.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Saturday 01 March 2003 08:57 am, George Peverill wrote:
> I am running a small network (about 10-12 machines) with a linux
> gateway machine providing http/ssh/vpn(pptp)/firewalling/NAT
> Recently we've had someone that loves to hog bandwidth a tad (ie:
> downloading movies at 150-200k/s) while we slave away

If you have a manageable switch, manually set his switch port to
half-duplex.  That will have the desired effect and can be
conveniently explained away if he ever causes problems for you.

Kelly


