From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: work ip address at home
Date: Wed, 22 Oct 2003 19:21:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310221821.h9MILt701076@onyx.rockstone.co.uk>
References: <7C9884991ADAE0479C14F10C858BCDF5122E78@alderaan.smgtec.com> <20031022125857.K34090@chemsun.chem.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031022125857.K34090@chemsun.chem.umn.edu>
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
To: Netfilter@Lists.Netfilter.org

On Wednesday 22 October 2003 7:15 pm, Brent Gregersen wrote:

> On Wed, 22 Oct 2003, Daniel Chemko wrote:
> > Well, I'd say that VPN is the most obvious solution for this problem,
> > but since you haven't done that already, I assume you aren't doing this
> > above the radar, or without network competent administrators.

> The license server is a machine I do not have access to. It is running
> Elan License Manager software for Tecplot (application I want to use at
> home to prepare graphs/plots for journal articles). I believe tecplot
> compares the ip address of application machine to a 'valid' ip domain
> contained in license obtained from the license server.  This was the
> reasoning behind the 'trick application into thinking I am at work'
> approch. I could be wrong on this however. If thats the case, I'll look
> into implementing a VPN solution between my home machine and work machine.
> (wrong forum, but any pointers/urls on useful VPN software?)

http://www.freeswan.org will allow you to "extrude" an IP address from your 
work network to your home machine across an IPsec VPN so you can fool the 
software the way you describe.

Antony.

-- 

If books were designed by Microsoft, the Anarchist's Cookbook would explode 
when you read it.

 - Mark W Schumann

