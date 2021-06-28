From: Stephen Satchell <list@satchell.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 06:36:08 -0700
Message-ID: <88dab1b9-e568-0352-b574-b32f1764bce9@satchell.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
 <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
 <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
 <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
 <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
 <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
 <83719383-c18d-dcb6-07f6-f123872fa68b@thelounge.net>
 <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 6/28/21 4:47 AM, Alessandro Vesely wrote:
> One "best practice" that I'd object to is blindly restoring whatever was 
> saved on shutdown.  How can one control that?  Booting with some clean, 
> well-defined data looks safer.

In my home-brew iptables(8) scripts written as a shell script quite a 
few years ago, I use shell functions to actually build the commands. 
The specifications are coded in shell arrays, one for each type 
"pinhole".  This resulted in a mostly-closed implementation.

Originally, the script was invoked at boot time via rc.local entry. 
When I would make a change, I would then manually run the script as 
root.  Manual changes are few and far between, usually because I've 
taken on a new task that requires a few more ports be opened.

With my move to Ubuntu, plus replacing my LAN-to-public interface with a 
Unity appliance, I've not taken the time to port the script to Python, 
nor to build a systemd configuration for it.  Indeed, with Ubuntu I'm 
using UFW, adding reverse path filtering plus rate limiting on pings.

