From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Subject: Addendum to Teo En Ming's Guide to Configuring Asterisk/FreePBX with
 Cisco 7960 IP Phones
Date: Fri, 25 Dec 2020 13:15:14 +0800
Message-ID: <081c770b47ec15cc64196bcb90a8aaca@teo-en-ming.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: ceo@teo-en-ming-corp.com

Subject: Addendum to Teo En Ming's Guide to Configuring Asterisk/FreePBX 
with Cisco 7960 IP Phones

Author: Mr. Turritopsis Dohrnii Teo En Ming (TARGETED INDIVIDUAL)

Country: Singapore

Date: 25 Dec 2020 Friday Singapore Time

Type of Publication: Plain Text

Document version: 20201225.01

=========================================================================================

Please refer to Teo En Ming's earlier guide.

Guide: Teo En Ming's Guide to Configuring Asterisk/FreePBX with Cisco 
7960 IP Phones
Link: 
http://lists.digium.com/pipermail/asterisk-users/2020-December/295581.html

In the above mentioned guide, under Section 12: Caveats, it was 
mentioned as follows:

"I can now make outgoing phone calls on my Cisco 7960 IP phone.

However, if Voicemail in my extension configuration is set to Disabled,
and when I try to dial my DID number, it says "Number not valid".

Only when I change Voicemail to Enabled, and when I try to dial my DID
number, it says:

"The person at extension 1600 is unavailable. Please leave your message
after the tone, when done hang up or press the # key."

It seems that incoming calls will not be routed to extension 1600.

I will need to do more troubleshooting on this at a future date."

Now, I am pleased to announce that, this final issue has been resolved 
on Christmas Day 2020.

The steps taken to resolve this final issue are as follows:

Login to Teo En Ming's FreePBX GUI at https://192.168.1.9.

Click Applications > Extensions.

Click the Pencil icon to edit the PJSIP extension 1600.

Click Advanced tab.

For Rewrite Contact, you MUST change the setting from Yes to No.

Click Voicemail tab.

Change Enabled to Yes.

For Require From Same Extension, click Yes.

Click Submit.

You MUST click Apply Config for the changes to take effect!

Voila! All issues have been solved.

Mr. Turritopsis Dohrnii Teo En Ming, 42 years old as of 25 December 2020 
Friday, is a TARGETED INDIVIDUAL (TI) living in Singapore. He is an IT 
Consultant with a System Integrator (SI)/computer firm in Singapore. He 
is an IT enthusiast.





-- 
-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: 
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's 
Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the 
United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan (5 Aug 
2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----
