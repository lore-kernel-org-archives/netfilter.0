From: "Ray Anderson" <rsa@rb-com.com>
Subject: RE: Cannot Ping Local Network after Executing rc.firewall script
Date: Thu, 11 Mar 2004 15:22:14 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c407bf$b05e8930$2405010a@rsa>
References: <200403112315.18267.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403112315.18267.Antony@Soft-Solutions.co.uk>
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

The other thing to check is the ipv4_forward value.

In some linux distros, the ipforward option needs to be set up in the
/etc/sysconfig/network script, and isn't set automatically with iptables
restore.

-=Ray
+-----------------------------------------------------------+
|                         | Ray Anderson                    |
|           |             | Systems Development Manager     |
|           |             | 916.788.2444 (Office)           |
|          (O)            | 916.798.9439 (Mobile)           |
|X--------<_._>--------X  | PRIDE Industries                |
|         (___)           |                                 |
|                         | http://www.prideindustries.com  |
+-----------------------------------------------------------+
Clouds are very effective for evasive action....They're a good way to get
home when you're alone.
Lt. Colonel John C. Meyer, USAAF


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: Thursday, March 11, 2004 3:15 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Cannot Ping Local Network after Executing 
> rc.firewall script
> 
> 
> On Friday 12 March 2004 5:59 am, Harish Sabnani wrote:
> 
> > Hi All,
> >
> > I am using Iptables with Ip Masquearde, with a simple 
> rc.firewall script to
> > share my internet connection for the last so many months, today I
> > configured a new server with the same settings but after the script
> > executes I am not able to ping computers in my local 
> network and the moment
> > I restart the Iptables I am able too?I just dont understand 
> where I am
> > going wrong?Any pointers will be apprecaited.
> 
> It sounds like your netfilter rules are not being loaded on startup.
> 
> Check your startup scripts (what, and where, they might be, 
> depends entirely 
> on your Linux distribution) to make sure that your ruleset is 
> being loaded 
> when the new system boots up.
> 
> Regards,
> 
> Antony.
> 
> -- 
> If you can't find an Open Source solution for it, then it 
> isn't a real 
> problem.
> 
>                                                      Please 
> reply to the list;
>                                                            
> please don't CC me.
> 
> 


