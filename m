From: Michael Gale <mgale@utilitran.com>
Subject: Re: public ip on LAN
Date: Fri, 2 Jan 2004 10:15:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040102101548.5ca2acf1.mgale@utilitran.com>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
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


Ahhh.. this makes sense .. I agree with John ... on my firewall I have 25 virtual IP addresses. Each IP gets DNAT to a internal server.

If you have lots of clients this can get confusing ... why not setup apache with virtual host ... each host can point to it's own directory and the uses can just upload the data to their home dir on that server.

Michael.



On Fri, 02 Jan 2004 22:49:39 +0530
Amit Pasari <info@amitpasari.com> wrote:

> Thanks John,
> Let me explain
> on My LAN i have ip address - 172.16.1.1
> subnet - 255.255.0.0
> on My WAN i have ipaddress - 203.122.51.178
> subnet - 255.255.255.240
> 
> Now , my clients want to have public / Live ip instead of private ips which 
> i am giving as  many of my clients uses webserver , and other applications 
> which people from outside world needs to access .
> I can redirect  ports for one clients but how about 10 clients wanting the 
> same .
> So i need to give them a public ip so that all the traffic can be 
> redirected their ip .
> 
> 
> Regards
> Amit
> 
> At 09:54 PM 1/2/04, you wrote:
> >On Fri, 2004-01-02 at 11:30, Amit Pasari wrote:
> > > Hello,
> > > I am using Redhat 8.0 with iptables to provide my client internet services
> > > . Everything is going well .
> > > i have been giving private ips of 172.16.0.0 series to my clients .
> > > But now some of my clients need public ips . i do have many public ips 
> > with
> > > me .so can somebody tell how can i give public ips to my clients .
> > >
> > > Thanks & Regards
> > > Amit
> > > Orangeinfoways.com
> >
> >Could you please clarify what you mean by giving ips to your clients?
> >Thanks - John
> >--
> >John A. Sullivan III
> >Chief Technology Officer
> >Nexus Management
> >+1 207-985-7880
> >john.sullivan@nexusmgmt.com
> >---
> >If you are interested in helping to develop a GPL enterprise class
> >VPN/Firewall/Security device management console, please visit
> >http://iscs.sourceforge.net
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

