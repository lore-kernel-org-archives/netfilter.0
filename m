From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Questions on rules syntax
Date: Thu, 12 Feb 2004 19:41:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040212184138.E9C803A4@sterenborg.info>
References: <402BBD9E.2020003@aros.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <402BBD9E.2020003@aros.net>
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

> I am trying to add a rule that covers part of a class C 
> range.  I want to allow 10.0.0.50 through 10.0.0.254 or 
> simply deny .1 through .50 then 
> allow the whole range.   Is there a syntax that will allow me 
> to do this 
> in one rule?  I have searched extensively before bugging the 
> list for help.

If you search on www.netfilter.org in the Patch-O-Matic Base repository, you
can find :
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-iprange

For this, you will have to patch and recompile your own kernel as I don't
think this functionality is enabled in a default kernel from a Linux distro.


Gr,
Rob


