From: Primero <primero@fastwebnet.it>
Subject: Re: Redundant netfilter gateway
Date: Thu, 17 Jun 2004 23:12:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617231240.6db6043c@Zapata.homenetwork>
References: <810BC538117E9F4E9BB152E0C100DF1F0F46C5@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F0F46C5@farmer.vikus.net>
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

On Thu, 17 Jun 2004 16:52:06 -0400
"Patrick Ahler" <patrick@vikus.com> wrote:


> over. This is not redundancy and is dirty. Does anyone have any
> suggestions on how to do this better?
> 

First of all i never tried what i'm gonna suggest, but you dould document and try it out if you like it :)

When i was documenting about Linux Virtual Server i found very interesting information about redundancy of Firewall with Director funcionts managed with an "Active-Active" solution.

you can take a look at http://www.linuxvirtualserver.org
and http://www.ultramonkey.org/papers/active_active/active_active.shtml
In this configuration the 2 firewalls share the same IP and MAC Address. Then , using a daemon called "saru", they divide the load in two parts and handle them in a load balanced - fault tolerant way.

It seemed very interesting and i think i'm gonna try it as early as i can.

check it out :)

Bye

