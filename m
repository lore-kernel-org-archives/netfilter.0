From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: splitting one network physically using linux box.
Date: Thu, 13 Jun 2002 16:47:53 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131548.QAA08074@slate.rockstone.co.uk>
References: <20020507110703.2ef33390.daniel.rycaj@fuchs.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020507110703.2ef33390.daniel.rycaj@fuchs.pl>
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
To: netfilter@lists.samba.org

On Tuesday 07 May 2002 10:07 am, Daniel Rycaj wrote:

> hi,
>
> I have a *very* standard situation:
>
> network: 10.1.1.97/27
>
> 	   small router			10 PCs
> 	---[ 10.1.1.97 / 27 ] --------- [ 10.1.1.98-108 ]
>
> Now I want to create a firewall between the "small router" and "10 PCs".
> The only problem is: nobody should change configuration of PC.
> So the default gw still should be set to 10.1.1.97 on each PC.

I can understand why you don't want to change the configurations of the PCs.

I there any REALLY GOOD reason why you can't change the configuration on the 
router ?

If you do not want to do that, you will end up with a pretty horrible and 
difficult arrangement on your Linux box.....

 

Antony.

