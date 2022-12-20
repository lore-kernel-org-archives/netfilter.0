From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 21:09:35 +0100
Message-ID: <660f2be3-07bf-f6df-5c70-b39f04cd46ff@thelounge.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
 <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
 <78479036-266c-5e4b-daa0-84a462a7aae6@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <78479036-266c-5e4b-daa0-84a462a7aae6@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 20.12.22 um 21:05 schrieb ToddAndMargo:
> On 12/20/22 12:01, Reindl Harald wrote:
>>
>> no you need to understand the rule above
>> it's RAW PREROUTING, all your rules below are INPUT
> 
> 
> Do you have a link for that?

i gave you the link already: 
https://gitlab.alpinelinux.org/alpine/awall/-/issues/1540

for any other information type "iptables CT target" in any random search 
engine

for understanding of basics like RAW/M;ANGLE/PREROUTING you need to read 
docs and google for "iptables flowchart"

sorry, a maling-list can't replace reading docs and understand how 
iptables is working - that should be done before creating rulesets to 
begin with
