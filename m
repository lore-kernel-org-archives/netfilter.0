From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 20:48:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311262048.49827.Antony@Soft-Solutions.co.uk>
References: <1069853846.3fc4ac966be15@paris-hme1> <20031126151015.GB4486@cannon.eng.us.uu.net> <1069879109.3fc50f45e7331@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069879109.3fc50f45e7331@paris-hme1>
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

On Wednesday 26 November 2003 8:38 pm, zynkx wrote:

> hi Ramin and tanx for your trouble ;))
>
> what i am looking for is the adresses from hotmail and
> yahoo from wich smtp connections may come from :)
>
> i have a smtp running and i need to allow traffic
> coming from these two, (hotmail and yahoo).

I'm not quite sure why you want to accept email only from Hotmail and Yahoo, 
and from nowhere else (a lot of people I know do the exact opposite!), 
however I still think an easier solution to your erquirement is to accept all 
email through your firewall, and then accept only mail from Hotmail / Yahoo 
on your mail server - because that can select based on the sender's address, 
without needing to know the IPs of their mail servers (which may change one 
day without you knowing).

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


