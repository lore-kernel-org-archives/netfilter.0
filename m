From: Jeff Kletsky <jmk@wagsky.com>
Subject: Empirically determined limits on identifier name length
Date: Wed, 23 Aug 2017 14:58:23 -0700
Message-ID: <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
 <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
 <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jeff Kletsky <netfilter@allycomm.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

At least working with the HEAD version of nftables v0.7, current library 
versions, and kernel 4.9,
the limits on identifier length that I have determined empirically (I 
have not examined the code):

* chain, set -- 31 characters
* table -- (not examined, but *guessing* 31 characters as well)

* define -- limit in excess of 65 characters

The error message when the limit is exceeded for the "in-kernel" chain 
and set identifiers is similar to

     nftables.conf:3:1-14: Error: Could not process rule: Numerical 
result out of range
     flush ruleset
     ^^^^^^^^^^^^^^

where the line identified has nothing to do with the offending identifier
(it is the first "actionable" statement of the file)

HTH someone else


Jeff



~/build/nftables$ git log -1
commit d74eed8c9649e9278b69f2cd0fd92f71e3e19cfb (HEAD -> master, tag: 
2017-08-19, origin/master, origin/HEAD)
Author: Varsha Rao <rvarsha016@gmail.com>
Date:   Wed Aug 16 19:48:17 2017 +0530


~/build/libmnl$ git log -1
commit fbe0f33b45abd585eb9f52cb56d751a750667dc6 (HEAD -> master, tag: 
2017-08-19, origin/master, origin/HEAD)
Author: Guillaume Nault <g.nault@alphalink.fr>
Date:   Wed Aug 3 12:52:34 2016 +0200


~/build/libnftnl$ git log -1
commit d58998312375de0865091cfc5d00ddd271d9a44c (HEAD -> master, tag: 
2017-08-19)
Author: Eric Leblond <eric@regit.org>
Date:   Thu Jul 6 13:58:27 2017 +0100

(my libnftl is presently two commits behind origin/master)


kernel 4.9.28-38




$ cat nftables.conf
#!/usr/sbin/nft -f

flush ruleset

table inet global {

     define 
identifier123456789212345678931234567894123456789512345678961234. = one
     define 
identifier123456789212345678931234567894123456789512345678961234_ = one


     chain prerouting12345678921234567893. {
         type filter hook prerouting priority -175
     }

     chain prerouting12345678921234567893_ {
         type filter hook prerouting priority -50
     }

     set identifier12345678921234567893. {
         type inet_service
     }

     set identifier12345678921234567893_ {
         type inet_service
     }

}


