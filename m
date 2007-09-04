From: "Peng Yang" <pey204@gmail.com>
Subject: problem on iptables
Date: Tue, 4 Sep 2007 14:48:30 -0400
Message-ID: <e3c78d830709041148w526b78d5nb9b0dffe3a8a81a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=TRdDX3EEVIqAodbGsfV9MAxGbUqyEQIl64EXFbW2rUTW9MwCahUwhmBep5VRN2Acl8Vx78dWeWMDuD1/uBYSLdSnEG3zhXgokoedo5BrIz+YqKe8QteDeNHR792PKUWs7cRbZEQb+LeJkyOFco018SSa3zXz1uDLPs7xzUvLpII=
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
In our current kernel, iptables doesn't work due to the error "can't
initialize iptables table `filter'".
I suspect that the netfilter is not turned on in the kernel.
We download the v2.6.20.11 sourcecode and try to do a menuconfig but
the networking packet filtering framework does not provide any option
for us to select to turn on netfilter. Can anyone let me know what patch files
I need to add to allow me to choose this netfilter feature?

thanks
peng

