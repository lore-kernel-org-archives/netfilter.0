From: "Chris Baker" <cbaker@bbbscentralohio.org>
Subject: RE: Questions on rules syntax
Date: Thu, 12 Feb 2004 14:00:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0A9604FAD805DD4CB404FFA1B950747717F353@msbbbs1.bbbs.bbbscentralohio.org>
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
To: 'Scott Hall' <halls@aros.net>, netfilter@lists.netfilter.org

It looks like you'll just have to do the math or get someone who likes doing
it:

ALLOW 10.0.0.128/25
This allows 128-255.
ALLOW 10.0.0.64/26
This allows 64-127.
ALLOW 10.0.0.56/29.
This allows 56-63.
ALLOW 10.0.0.52/30
This allows 52-55.
ALLOW 10.0.0.50/31
This allows 50-51.

REJECT 10.0.0.0/27.
This rejects 0-31.
REJECT 10.0.0.32/28
This rejects 32-47.
REJECT 10.0.0.48/31
This rejects 48-49.


Register your team online today!
BOWL FOR KIDS'SAKE 2004
Saturday, March 6, 2004
www.bfkscentralohio.org
You'll be "bowled over" when our brochure "strikes" your mailbox at the end
of January.sorry.we couldn't help ourselves! If you do not receive one,
please contact me!

==============================================================
Chris Baker -- technical specialist
614-839-2447x108 -- cbaker@bbbscentralohio.org
www.bbbscentralohio.org -- Big Brothers Big Sisters of Central Ohio
Opinions expressed in this e-mail are solely my own.

The document(s) accompanying or within this email transmission may contain
confidential information belonging to Big Brothers Big Sisters of Central
Ohio, which is legally privileged for the entity named above.  If you are
not the intended recipient, you are hereby cautioned that any disclosure,
copying, distribution, or the taking of any action in reliance on the
contents of this email information is strictly prohibited.  If you receive
this email in error, please notify us immediately by fax (614-839-5437) or
phone (614-839-2447) to advise of the error.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Scott Hall
Sent: Thursday, February 12, 2004 12:54 PM
To: netfilter@lists.netfilter.org
Subject: Questions on rules syntax

I am trying to add a rule that covers part of a class C range.  I want 
to allow 10.0.0.50 through 10.0.0.254 or simply deny .1 through .50 then 
allow the whole range.   Is there a syntax that will allow me to do this 
in one rule?  I have searched extensively before bugging the list for help.

thanks,

-- 
Scott Hall
ArosNet Consulting



