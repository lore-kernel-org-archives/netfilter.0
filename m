From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Iptables Problem on DNS Server
Date: Fri, 21 Jun 2002 18:23:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621182308.B2957@funkyjesus.org>
References: <003f01c219c5$4c54e900$6500a8c0@systemsadmin> <20020621172016.GY26150@cannon.eng.us.uu.net>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020621172016.GY26150@cannon.eng.us.uu.net>; from ramin@cannon.eng.us.uu.net on Fri, Jun 21, 2002 at 01:20:16PM -0400
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Fri, Jun 21, 2002 at 01:20:16PM -0400, Ramin Alidousti wrote:
> >> What rules do you have ?
> > 
> > how would i know if what kind of rules do i have?
> 
> You could, eg, cat your firewall script, ie, if you knew
> where it was.

Run "iptables -L -n" and, as long as it isn't too long, send the results to
this mailing list, along with any relevant IP addresses.

-- 
FunkyJesus System Administration Team


