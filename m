From: Thomas Luening <toml@thlu.de>
Subject: Multiples Chain with same hook - Default-Behavior?
Date: Tue, 28 Jan 2020 12:35:18 +0100
Message-ID: <c6174010-de04-5dd7-2d28-58dc3e7aa537@mail>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

I have a question about the default behavior of nftables, when a certain program (unwanted) creates another chain (INPUT+OUTPUT) 
with the input/output-hook. See examples below. 'INPUT' is created by the Programm, 'input' are my regular Rules. This is only a 
test example. My concern is whether there may be a risk to my own rules in the upper chain default acceptance (Test 1).

Apparently it doesn't matter where I set the Policy=Drop when testing, in the upper (INPUT) or lower (input) ruleset, Drop 
always works. But if the upper chain says "Policy=Accecpt" (Test 1) and the lower Drop, the Accept doesn't work. Are the rules 
(and policy) in the lower input chain still respected, even if the policy in the upper one has already "accepted"?

Thank you, best Regards
Tom


Test 1:
-------
table ip filter {
     chain INPUT {
         type filter hook input priority 0; policy accept;
     }
     chain OUTPUT {
         type filter hook output priority 0; policy accept;
     }

     chain input {
         type filter hook input priority 0; policy drop;
     }
     chain output {
         type filter hook output priority 0; policy drop;
     }
}

Test 2:
-------
table ip filter {
     chain INPUT {
         type filter hook input priority 0; policy drop;
     }
     chain OUTPUT {
         type filter hook output priority 0; policy drop;
     }

     chain input {
         type filter hook input priority 0; policy accept;
     }
     chain output {
         type filter hook output priority 0; policy accept;
     }
}
