From: "Gurpreet Kaur" <G.Kaur@globallogic.com>
Subject: hashlimit working
Date: Wed, 12 Jan 2011 11:32:57 +0530
Message-ID: <C6BC71B0FE52F34DB131AA6993A023F601199C77@ex2-del1.synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

 

I am stuck in a problem while working with hashlimit in iptables. I had
gone through the code of iptables also but haven't got any success. The
problem is with -hashlimit-upto option. I have observed the following
behaviour while providing the limts.

For ant value between a->b, it takes the value as b/s.

The following examples will further explain it

For limit values between 5000/s and 10000/s, it always take 10000/s. 
For limit values between 3333/s and 5000/s, it always take 5000/s. 
For limit values between 2500/s and 3333/s, it always take 3333/s. 
For limit values between 2000/s and 2500/s, it always take 2500/s. 
For limit values between 1666/s and 2000/s, it always take 2000/s. 
For limit values between 1428/s and 1666/s, it always take 1428/s. 
For limit values between 1250/s and 1428/s, it always take 1428/s. 
For limit values between 1111/s and 1250/s, it always take 1250/s. 
For limit values between 1000/s and 1111/s, it always take 1111/s. 
For limit values between 909/s and 1000/s, it always take 1000/s. 
 

From the code, it appears that hashlimit module store an avg factor
internally. It is calculated on the basis of the rate that user gives
and they are integer numbers starting with 1. (1 means 10000/s). I want
to know how hashlimit uses this avg factor to calculate packet per
second. 

 

An early reply will be highly appreciated.

 

Regards

Gurpreet Kaur
