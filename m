From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: satellite users can't connect to port forwarded services
Date: Wed, 10 Jul 2002 13:31:11 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710173110.GC25368@cannon.eng.us.uu.net>
References: <F2178nzRC1uQdfNPqvW0000bba8@hotmail.com> <5.1.0.14.2.20020710114418.025cd680@pop.netzero.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20020710114418.025cd680@pop.netzero.net>
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
To: Ramin K <mr_list@netzero.net>
Cc: j davis <davis_compz@hotmail.com>, netfilter@lists.samba.org

On Wed, Jul 10, 2002 at 11:49:31AM -0500, Ramin K wrote:

> At 12:00 AM 7/10/2002 +0000, j davis wrote:
> 
> >Starband satallites claim they dont support real-time protocalls
> >like telnet,ssh,ftp and so on. And absolutley do not allow incoming
> >traffic from the internet thats not requested. except maybe a ping.
> >
> >jd
> >http://www.taproot.bz
> 
> 
>         Yes, yes ssh and telnet are going to be slow and "don't call us if 
> they suck" is the standard satellite provider line. However FTP, POP, SMTP 
> being unavailable generally qualify you for broken network status whether 
> they are interactive or not.
> 
>         However in this case the satellite user can reach other sites on 
> the internet via those protocols, just not me and roughly since the 
> introduction of the new firewall.

Is it only the director of IT's satellite based host that has problems
connecting to the internal host?

In your original posting you sent the top-level firewall script without
sending the called scripts like:

/etc/firestarter/allow-all
/etc/firestarter/allow-service-machine
/etc/firestarter/allow-service-all
...

Besides the logs you sent, how have they been logged? By any logging rule?

Ramin

